<?php include ("includes/header.php")?>
<?php include ("db.php"); ?>

<div class="container p-4">
    <h4>Formulario de contenidos</h4>
        <div class="col-md-4">

            <?php if(isset($_SESSION['mensaje'])) { ?>
                <div class="alert alert-<?= $_SESSION['tipo_mensaje'];?>
                alert-dismissible fade show" role="alert">
                <?=$_SESSION['mensaje'] ?>
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            <?php session_unset(); } ?> 

            <div class="card card-body">
                <form action ="save.php" method="POST">
                    <div class="form-group">
                        <input type="text" name="Titulo" class="form-control" 
                        placeholder="Titulo de contenido" autofocus>
                    </div><br>

                    <div class="form-group">
                        <textarea name="Descripcion" rows="2" class="form-control" 
                        placeholder="Descripcion de contenido"></textarea>
                    </div><br>

                    <input type="submit" class="btn btn-success btn-block" name="Guardar_contenido" value="Guardar">
                </form>
            </div>
        </div><br>
        <div class="col-md-10">
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Nombre</th>
                        <th>Descripcion</th>
                        <th>Fecha creacion</th>
                        <th>Fecha actualizacion</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                    $query = "SELECT * FROM contenido";
                    $resultado_contenidos = mysqli_query($conn,$query);

                    while($row = mysqli_fetch_array($resultado_contenidos)) { ?>
                        <tr>
                            <td><?php echo $row['ID']?></td>
                            <td><?php echo $row['nombre']?></td>
                            <td><?php echo $row['descripcion']?></td>
                            <td><?php echo $row['fecha_creacion']?></td>
                            <td><?php echo $row['fecha_actualizacion']?></td>
                            <td>
                                <a href="update.php?id=<?php echo $row['ID']?>">
                                    <i class="fas fa-edit"></i><br>
                                </a>
                                <a href="delete.php?id=<?php echo $row['ID']?>">
                                    <i class="fas fa-trash-alt"></i><br>
                                </a> 
                            </td>
                        </tr>
                    <?php } ?> 
                </tbody>
        </table>
    </div>
</div>




<?php include ("includes/footer.php")?>