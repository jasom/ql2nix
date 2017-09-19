
{ buildLispPackage, stdenv, fetchurl, lisp-project_clouchdb, 
   lisp_s-base64, lisp_parenscript, lisp_drakma, lisp_closer-mop,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_s-base64 lisp_parenscript lisp_drakma lisp_closer-mop  ];
      inherit stdenv;
      systemName = "clouchdb";
      
      sourceProject = "${lisp-project_clouchdb}";
      patches = [];
      lisp_dependencies = "${lisp_s-base64} ${lisp_parenscript} ${lisp_drakma} ${lisp_closer-mop}";
      name = "lisp_clouchdb_0.0.16";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
