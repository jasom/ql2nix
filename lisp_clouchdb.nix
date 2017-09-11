
{ buildLispPackage, stdenv, fetchurl, lisp-project_clouchdb, 
   lisp_closer-mop, lisp_drakma, lisp_flexi-streams, lisp_parenscript, lisp_s-base64,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_closer-mop lisp_drakma lisp_flexi-streams lisp_parenscript lisp_s-base64  ];
      inherit stdenv;
      systemName = "clouchdb";
      
      sourceProject = "${lisp-project_clouchdb}";
      patches = [];
      lisp_dependencies = "${lisp_closer-mop} ${lisp_drakma} ${lisp_flexi-streams} ${lisp_parenscript} ${lisp_s-base64}";
      name = "lisp_clouchdb_0.0.16";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
