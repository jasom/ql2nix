
{ buildLispPackage, stdenv, fetchurl, lisp-project_maiden, 
   lisp_drakma, lisp_jsown, lisp_maiden, lisp_plump,  
  sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_drakma lisp_jsown lisp_maiden lisp_plump  ];
      inherit stdenv;
      systemName = "maiden-api-access";
      
      sourceProject = "${lisp-project_maiden}";
      patches = [];
      lisp_dependencies = "${lisp_drakma} ${lisp_jsown} ${lisp_maiden} ${lisp_plump}";
      name = "lisp_maiden-api-access-20170725-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" ];
    }
