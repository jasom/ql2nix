
{ buildLispPackage, stdenv, fetchurl, lisp-project_a-cl-logger, 
   lisp_closer-mop, lisp_local-time, lisp_cl-json, lisp_cl-interpol, lisp_symbol-munger, lisp_iterate,  
  sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_closer-mop lisp_local-time lisp_cl-json lisp_cl-interpol lisp_symbol-munger lisp_iterate  ];
      inherit stdenv;
      systemName = "a-cl-logger";
      
      sourceProject = "${lisp-project_a-cl-logger}";
      patches = [];
      lisp_dependencies = "${lisp_closer-mop} ${lisp_local-time} ${lisp_cl-json} ${lisp_cl-interpol} ${lisp_symbol-munger} ${lisp_iterate}";
      name = "lisp_a-cl-logger-20170227-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" ];
    }
