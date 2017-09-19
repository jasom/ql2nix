
{ buildLispPackage, stdenv, fetchurl, lisp-project_verrazano, 
   lisp_closer-mop, lisp_parse-number, lisp_cl-ppcre, lisp_trivial-shell, lisp_iterate, lisp_cffi, lisp_metabang-bind, lisp_cxml,  
  sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_closer-mop lisp_parse-number lisp_cl-ppcre lisp_trivial-shell lisp_iterate lisp_cffi lisp_metabang-bind lisp_cxml  ];
      inherit stdenv;
      systemName = "verrazano";
      
      sourceProject = "${lisp-project_verrazano}";
      patches = [];
      lisp_dependencies = "${lisp_closer-mop} ${lisp_parse-number} ${lisp_cl-ppcre} ${lisp_trivial-shell} ${lisp_iterate} ${lisp_cffi} ${lisp_metabang-bind} ${lisp_cxml}";
      name = "lisp_verrazano-20120909-darcs";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" ];
    }
