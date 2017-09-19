
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-ssdb, 
   lisp_babel, lisp_parse-number, lisp_flexi-streams, lisp_usocket, lisp_cl-ppcre, lisp_rutils,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_babel lisp_parse-number lisp_flexi-streams lisp_usocket lisp_cl-ppcre lisp_rutils  ];
      inherit stdenv;
      systemName = "cl-ssdb";
      
      sourceProject = "${lisp-project_cl-ssdb}";
      patches = [];
      lisp_dependencies = "${lisp_babel} ${lisp_parse-number} ${lisp_flexi-streams} ${lisp_usocket} ${lisp_cl-ppcre} ${lisp_rutils}";
      name = "lisp_cl-ssdb-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
