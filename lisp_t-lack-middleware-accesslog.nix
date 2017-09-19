
{ buildLispPackage, stdenv, fetchurl, lisp-project_lack, 
   lisp_flexi-streams, lisp_quri, lisp_prove, lisp_ironclad, lisp_prove-asdf,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_flexi-streams lisp_quri lisp_prove lisp_ironclad lisp_prove-asdf  ];
      inherit stdenv;
      systemName = "t-lack-middleware-accesslog";
      
      sourceProject = "${lisp-project_lack}";
      patches = [];
      lisp_dependencies = "${lisp_flexi-streams} ${lisp_quri} ${lisp_prove} ${lisp_ironclad} ${lisp_prove-asdf}";
      name = "lisp_t-lack-middleware-accesslog-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
