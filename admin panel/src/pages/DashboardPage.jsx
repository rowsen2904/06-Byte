import MyHeader from "../components/MyHeader/MyHeader.jsx";
import React, { useState } from "react";
import {useTranslation} from "react-i18next";
import MyButton1 from "../components/MyButton1.jsx";
import { io } from "socket.io-client";

const socket = io.connect("ws://10.20.110.118:7777/ws/notification/");

const DashboardPage = () => {

    const send = () => {
        socket.emit(decodeURI({text: 'hi'}));
    }
    
    const { t } = useTranslation()

    const cards = [
        {id: 1, name: t("parent_categories"), count: 12, to: '/parent_categories'},
        {id: 2, name: t("child_categories"), count: 34, to: '/child_categories'},
        {id: 3, name: t("meals"), count: 103, to: '/meals'}
    ];



    return(
        <div className={`w-full`}>
            <MyHeader search={true} title={t("dashboard")} />
            <div className={``}>
                {/* <div className={`grid grid-cols-3 gap-5 justify-items-center m-5 md:m-10`}>
                    {cards.map((card) => (
                        <div key={card.id} className={`col-span-3 md:col-span-1 w-full`}>
                            <MyDashboardCard to={card.to} name={card.name} count={card.count} />
                        </div>
                    ))}
                </div> */}
                <MyButton1 onClick={send} title="send" />
            </div>
        </div>
    );
}

export {DashboardPage};