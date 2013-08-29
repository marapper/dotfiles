/**
 * @param ${TYPE_HINT} $${PARAM_NAME}
 * @return $this
 */
public ${STATIC} function set${NAME}($${PARAM_NAME})
{
#if (${STATIC} == "static")
    static::$${FIELD_NAME} = $${PARAM_NAME};
#else
    $this->${FIELD_NAME} = $${PARAM_NAME};
    return $this;
#end
}
