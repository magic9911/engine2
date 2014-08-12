struct INIClass_S;
typedef struct INIClass_S INIClass;

bool INIClass__GetBool(INIClass *this, const char *section, const char *key, bool def);
