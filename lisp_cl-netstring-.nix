
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-netstring-plus, 
   lisp_flexi-streams, lisp_trivial-utf-8,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_flexi-streams lisp_trivial-utf-8  ];
      inherit stdenv;
      systemName = "cl-netstring+";
      
      sourceProject = "${lisp-project_cl-netstring-plus}";
      patches = [];
      lisp_dependencies = "${lisp_flexi-streams} ${lisp_trivial-utf-8}";
      name = "lisp_cl-netstring--20150709-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
