
{ buildLispPackage, stdenv, fetchurl, lisp-project_uuid, 
   lisp_ironclad, lisp_trivial-utf-8,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_ironclad lisp_trivial-utf-8  ];
      inherit stdenv;
      systemName = "uuid";
      
      sourceProject = "${lisp-project_uuid}";
      patches = [];
      lisp_dependencies = "${lisp_ironclad} ${lisp_trivial-utf-8}";
      name = "lisp_uuid-20130813-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
