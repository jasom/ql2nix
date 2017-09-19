
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-growl, 
   lisp_ironclad, lisp_flexi-streams, lisp_usocket, lisp_trivial-utf-8,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_ironclad lisp_flexi-streams lisp_usocket lisp_trivial-utf-8  ];
      inherit stdenv;
      systemName = "cl-growl";
      
      sourceProject = "${lisp-project_cl-growl}";
      patches = [];
      lisp_dependencies = "${lisp_ironclad} ${lisp_flexi-streams} ${lisp_usocket} ${lisp_trivial-utf-8}";
      name = "lisp_cl-growl-20161208-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
