def GJ_inverse(m):
    row_num = len(m)
    #check if square matrix
    for i in range(row_num):
        if len(m[i]) != row_num:
            return
    

    #create identity matrix
    iden = [[0]*(row_num) for i in range(row_num)]
    for i in range(row_num):
        iden[i][i] =1
        m[i] = m[i]+iden[i]

    #process
    for i in range(row_num-1,0,-1):
        if m[i-1][0]< m[i][0]:
            temp = m[i]
            m[i] = m[i-1]
            m[i-1] = temp

    for i in range(row_num):
        for j in range(row_num):
            if j!=i:
                temp = m[j][i] / m[i][i]
                for k in range(2*row_num):
                    m[j][k] -=m[i][k] * temp

    for i in range(row_num):
        temp = m[i][i]
        for j in range(2*row_num):
            m[i][j] /=temp
        m[i] = m[i][row_num:]

    return m


m = [[1,2],[3,4]]

[print(i) for i in GJ_inverse(m)]
    
