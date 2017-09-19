
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-logic, 
   lisp_alexandria,  
  sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria  ];
      inherit stdenv;
      systemName = "cl-logic";
      
      sourceProject = "${lisp-project_cl-logic}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria}";
      name = "lisp_cl-logic-20141217-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" ];
    }
