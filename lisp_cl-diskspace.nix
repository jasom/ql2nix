
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-diskspace, 
   lisp_cl-ppcre, lisp_cffi-grovel,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-ppcre lisp_cffi-grovel  ];
      inherit stdenv;
      systemName = "cl-diskspace";
      
      sourceProject = "${lisp-project_cl-diskspace}";
      patches = [];
      lisp_dependencies = "${lisp_cl-ppcre} ${lisp_cffi-grovel}";
      name = "lisp_cl-diskspace-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
