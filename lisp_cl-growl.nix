
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-growl, 
   lisp_flexi-streams, lisp_ironclad, lisp_trivial-utf-8, lisp_usocket,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_flexi-streams lisp_ironclad lisp_trivial-utf-8 lisp_usocket  ];
      inherit stdenv;
      systemName = "cl-growl";
      
      sourceProject = "${lisp-project_cl-growl}";
      patches = [];
      lisp_dependencies = "${lisp_flexi-streams} ${lisp_ironclad} ${lisp_trivial-utf-8} ${lisp_usocket}";
      name = "lisp_cl-growl-20161208-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
