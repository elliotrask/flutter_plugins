package com.builttoroam.devicecalendar.models

class Calendar(val id: String?, val name: String, val color: Long) {
    var isReadOnly: Boolean = false
    var accountName: String? = null
}