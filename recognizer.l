%{
    /* This demonstrates checking of an input value against words defined in a set */
}%

%%



is  |

am  |

were    |

be  |

are |

was |

being   |

should  |

will    |

would   |

can |

has |

had |

go  |

did |

does    |

have    |

do { printf("%s: is a verb\n", yytext); }

[a-zA-Z]+ { printf("%s: is not a verb\n", yytext); }

.|\n { ECHO; }

%%

int main()

{
    yylex();
}

int yywrap()
{
    return 1;
}