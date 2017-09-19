
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-odesk, 
   lisp_drakma, lisp_md5, lisp_iterate,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_drakma lisp_md5 lisp_iterate  ];
      inherit stdenv;
      systemName = "odesk";
      
      sourceProject = "${lisp-project_cl-odesk}";
      patches = [];
      lisp_dependencies = "${lisp_drakma} ${lisp_md5} ${lisp_iterate}";
      name = "lisp_odesk-20150608-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
