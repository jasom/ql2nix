
{ buildLispPackage, stdenv, fetchurl, lisp-project_http-body, 
   lisp_babel, lisp_cl-ppcre, lisp_cl-utilities, lisp_fast-http, lisp_flexi-streams, lisp_jonathan, lisp_quri, lisp_trivial-gray-streams,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_babel lisp_cl-ppcre lisp_cl-utilities lisp_fast-http lisp_flexi-streams lisp_jonathan lisp_quri lisp_trivial-gray-streams  ];
      inherit stdenv;
      systemName = "http-body";
      
      sourceProject = "${lisp-project_http-body}";
      patches = [];
      lisp_dependencies = "${lisp_babel} ${lisp_cl-ppcre} ${lisp_cl-utilities} ${lisp_fast-http} ${lisp_flexi-streams} ${lisp_jonathan} ${lisp_quri} ${lisp_trivial-gray-streams}";
      name = "lisp_http-body-20161204-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
