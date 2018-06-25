  view: priority {
    sql_table_name: JIRA.PRIORITY ;;

    dimension: id {
      primary_key: yes
      type: number
      sql: ${TABLE}.ID ;;
      hidden: yes
    }

    dimension_group: _fivetran_synced {
      type: time
      timeframes: [
        raw,
        time,
        date,
        week,
        month,
        quarter,
        year
      ]
      sql: ${TABLE}._FIVETRAN_SYNCED ;;
      hidden: yes
    }

    dimension: description {
      label: "Priority Description"
      type: string
      sql: ${TABLE}.DESCRIPTION ;;
    }

    dimension: name {
      label: "Priority Name"
      type: string
      sql: ${TABLE}.NAME ;;
    }

    measure: count {
      type: count
      drill_fields: [id, name, issue_priority_history.count]
      hidden: yes
    }
  }
