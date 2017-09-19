
{ buildLispPackage, stdenv, fetchurl, lisp-project_weft, 
   lisp_trivial-timeout, lisp_log4cl, lisp_bordeaux-threads, lisp_usocket,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_trivial-timeout lisp_log4cl lisp_bordeaux-threads lisp_usocket  ];
      inherit stdenv;
      systemName = "weft";
      
      sourceProject = "${lisp-project_weft}";
      patches = [];
      lisp_dependencies = "${lisp_trivial-timeout} ${lisp_log4cl} ${lisp_bordeaux-threads} ${lisp_usocket}";
      name = "lisp_weft-20170227-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
