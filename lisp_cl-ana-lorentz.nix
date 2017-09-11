
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-ana, 
   lisp_cl-ana-generic-math, lisp_cl-ana-linear-algebra, lisp_cl-ana-tensor, lisp_iterate,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-ana-generic-math lisp_cl-ana-linear-algebra lisp_cl-ana-tensor lisp_iterate  ];
      inherit stdenv;
      systemName = "cl-ana.lorentz";
      
      sourceProject = "${lisp-project_cl-ana}";
      patches = [];
      lisp_dependencies = "${lisp_cl-ana-generic-math} ${lisp_cl-ana-linear-algebra} ${lisp_cl-ana-tensor} ${lisp_iterate}";
      name = "lisp_cl-ana-lorentz-20170725-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
