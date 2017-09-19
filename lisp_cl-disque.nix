
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-disque, 
   lisp_babel, lisp_flexi-streams, lisp_usocket, lisp_cl-ppcre, lisp_rutils,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_babel lisp_flexi-streams lisp_usocket lisp_cl-ppcre lisp_rutils  ];
      inherit stdenv;
      systemName = "cl-disque";
      
      sourceProject = "${lisp-project_cl-disque}";
      patches = [];
      lisp_dependencies = "${lisp_babel} ${lisp_flexi-streams} ${lisp_usocket} ${lisp_cl-ppcre} ${lisp_rutils}";
      name = "lisp_cl-disque-20150923-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
