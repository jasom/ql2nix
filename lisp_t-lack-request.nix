
{ buildLispPackage, stdenv, fetchurl, lisp-project_lack, 
   lisp_clack-test, lisp_circular-streams, lisp_http-body, lisp_quri, lisp_prove-asdf,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_clack-test lisp_circular-streams lisp_http-body lisp_quri lisp_prove-asdf  ];
      inherit stdenv;
      systemName = "t-lack-request";
      
      sourceProject = "${lisp-project_lack}";
      patches = [];
      lisp_dependencies = "${lisp_clack-test} ${lisp_circular-streams} ${lisp_http-body} ${lisp_quri} ${lisp_prove-asdf}";
      name = "lisp_t-lack-request-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
