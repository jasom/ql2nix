
{ buildLispPackage, stdenv, fetchurl, lisp-project_clesh, 
   lisp_named-readtables, lisp_trivial-shell,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_named-readtables lisp_trivial-shell  ];
      inherit stdenv;
      systemName = "clesh";
      
      sourceProject = "${lisp-project_clesh}";
      patches = [];
      lisp_dependencies = "${lisp_named-readtables} ${lisp_trivial-shell}";
      name = "lisp_clesh-20120208-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
