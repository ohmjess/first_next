import React, { useEffect, useRef, useState } from 'react';
import DraggableItem from './DraggableItem';
import dynamic from 'next/dynamic';

const Droppable = dynamic(() => import('react-beautiful-dnd').then(mod => mod.Droppable), { ssr: false });
const Draggable = dynamic(() => import('react-beautiful-dnd').then(mod => mod.Draggable), { ssr: false });

type ItemType = { id: string; content: string };
type ColumnType = { name: string; items: ItemType[] };
type ColumnsType = { [key: string]: ColumnType };

interface ColumnProps {
    columnId: string;
    column: ColumnType;
    index: number;
    data: ColumnsType;
    setData: React.Dispatch<React.SetStateAction<ColumnsType>>;
    insertTask: (name: string, columnId: string, order: number) => void;
}

const Column: React.FC<ColumnProps> = ({ columnId, column, index, insertTask, setData, data }) => {
    const [isAddTaskOpen, setIsAddTaskOpen] = React.useState(false);
    const inputRef = useRef<HTMLInputElement>(null);
    const addTaskRef = useRef<HTMLDivElement>(null);

    useEffect(() => {
        if (isAddTaskOpen && inputRef.current) {
            inputRef.current.focus();
        }

        function handleClickOutside(event: MouseEvent) {
            if (addTaskRef.current && !addTaskRef.current.contains(event.target as Node)) {
                insertNewData()
                setIsAddTaskOpen(false);
            }
        }

        if (isAddTaskOpen) {
            document.addEventListener("mousedown", handleClickOutside);
        } else {
            document.removeEventListener("mousedown", handleClickOutside);
        }

        return () => {
            document.removeEventListener("mousedown", handleClickOutside);
        };
    }, [isAddTaskOpen]);

    const insertNewData = () => {
        try {
            if (inputRef.current?.value) {
                const newTask: ItemType = {
                    id: `${Date.now()}`, // สร้าง id ใหม่ตามเวลาปัจจุบัน หรืออาจสร้างแบบอื่นที่เหมาะสม
                    content: inputRef.current.value,
                };

                setData({ ...data, [columnId]: { name: column.name, items: [...column.items, newTask] } })

                // เรียก insertTask เพื่ออัปเดตข้อมูลในฐานข้อมูลหรือ backend
                insertTask(inputRef.current.value, columnId, data[columnId].items.length);

                inputRef.current.value = '';
            }

        } catch (error) {

        }
    }

    return (
        <>
            <Draggable draggableId={columnId} index={index} isDragDisabled={false}>
                {(provided) => (
                    <div
                        ref={provided.innerRef}
                        {...provided.draggableProps}
                        className="flex flex-col w-64 shadow-md bg-white border border-gray-300"
                    >
                        <h2 {...provided.dragHandleProps} className="text-lg font-bold bg-white shadow-md sticky top-0 z-10 px-4 py-2">
                            {column.name}
                        </h2>
                        <div className='px-4 max-h-[670px] overflow-y-auto p-2'>
                            <Droppable droppableId={columnId} type="item" direction='vertical' isDropDisabled={false} isCombineEnabled={false} ignoreContainerClipping={false}>
                                {(provided, snapshot) => (
                                    <div
                                        ref={provided.innerRef}
                                        {...provided.droppableProps}
                                        className={`flex flex-col gap-2 mb-2 ${snapshot.isDraggingOver ? 'bg-gray-100 border-teal-600' : ''}`}
                                    >
                                        {column.items.map((item, index) => (
                                            <DraggableItem key={item.id} item={item} index={index} />
                                        ))}
                                        {provided.placeholder}
                                        {!column.items.length && (
                                            <p className="text-center text-gray-500 mt-4">ไม่มีไอเท็มในคอลัมน์นี้</p>
                                        )}
                                    </div>
                                )}
                            </Droppable>

                            <div
                                ref={addTaskRef}
                                className={`${isAddTaskOpen ? 'block' : 'hidden'} bg-white p-0`}
                            >
                                <input type="text" className="w-full p-2 border border-gray-300 rounded-md" ref={inputRef} />
                            </div>
                        </div>
                        <button
                            onClick={() => setIsAddTaskOpen(true)}
                            className={`${isAddTaskOpen ? 'hidden' : 'block'} text-teal-500 opacity-0 hover:opacity-100 transition-opacity duration-300 hover:pointer-events-auto border-2 border-teal-500 rounded-md w-full px-2 py-1`}
                        >
                            เพิ่ม
                        </button>   
                    </div>
                )}
            </Draggable>
        </>
    );
};

export default Column;
