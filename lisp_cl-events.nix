
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-events, 
   lisp_blackbird, lisp_lparallel, lisp_log4cl, lisp_iterate, lisp_alexandria,  
  clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_blackbird lisp_lparallel lisp_log4cl lisp_iterate lisp_alexandria  ];
      inherit stdenv;
      systemName = "cl-events";
      
      sourceProject = "${lisp-project_cl-events}";
      patches = [];
      lisp_dependencies = "${lisp_blackbird} ${lisp_lparallel} ${lisp_log4cl} ${lisp_iterate} ${lisp_alexandria}";
      name = "lisp_cl-events-20160318-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
