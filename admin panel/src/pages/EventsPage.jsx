import React from 'react'
import MyHeader from '../components/MyHeader/MyHeader'

function EventsPage() {
    return (
        <div>
            <MyHeader title='Events' search={true} />
        </div>
    )
}

export {EventsPage};