
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-events, 
   lisp_alexandria, lisp_blackbird, lisp_iterate, lisp_log4cl, lisp_lparallel,  
  clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_blackbird lisp_iterate lisp_log4cl lisp_lparallel  ];
      inherit stdenv;
      systemName = "cl-events";
      
      sourceProject = "${lisp-project_cl-events}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_blackbird} ${lisp_iterate} ${lisp_log4cl} ${lisp_lparallel}";
      name = "lisp_cl-events-20160318-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
