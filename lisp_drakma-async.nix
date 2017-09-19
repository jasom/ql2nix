
{ buildLispPackage, stdenv, fetchurl, lisp-project_drakma-async, 
   lisp_drakma, lisp_fast-http, lisp_flexi-streams, lisp_cl-async-future, lisp_cl-async-ssl,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_drakma lisp_fast-http lisp_flexi-streams lisp_cl-async-future lisp_cl-async-ssl  ];
      inherit stdenv;
      systemName = "drakma-async";
      
      sourceProject = "${lisp-project_drakma-async}";
      patches = [];
      lisp_dependencies = "${lisp_drakma} ${lisp_fast-http} ${lisp_flexi-streams} ${lisp_cl-async-future} ${lisp_cl-async-ssl}";
      name = "lisp_drakma-async-20151031-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
