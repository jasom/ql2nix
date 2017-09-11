
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-skip-list, 
   lisp_cffi,  
  sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cffi  ];
      inherit stdenv;
      systemName = "cl-skip-list";
      
      sourceProject = "${lisp-project_cl-skip-list}";
      patches = [];
      lisp_dependencies = "${lisp_cffi}";
      name = "lisp_cl-skip-list-20130615-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" ];
    }
