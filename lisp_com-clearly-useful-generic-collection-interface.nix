
{ buildLispPackage, stdenv, fetchurl, lisp-project_com-clearly-useful-generic-collection-interface, 
   lisp_lparallel, lisp_bordeaux-threads, lisp_com-clearly-useful-protocols,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_lparallel lisp_bordeaux-threads lisp_com-clearly-useful-protocols  ];
      inherit stdenv;
      systemName = "com.clearly-useful.generic-collection-interface";
      
      sourceProject = "${lisp-project_com-clearly-useful-generic-collection-interface}";
      patches = [];
      lisp_dependencies = "${lisp_lparallel} ${lisp_bordeaux-threads} ${lisp_com-clearly-useful-protocols}";
      name = "lisp_com-clearly-useful-generic-collection-interface-20121125-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
