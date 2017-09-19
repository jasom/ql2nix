
{ buildLispPackage, stdenv, fetchurl, lisp-project_lack, 
   lisp_cl-cookie, lisp_prove, lisp_local-time, lisp_circular-streams, lisp_http-body, lisp_quri, lisp_ironclad, lisp_prove-asdf,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-cookie lisp_prove lisp_local-time lisp_circular-streams lisp_http-body lisp_quri lisp_ironclad lisp_prove-asdf  ];
      inherit stdenv;
      systemName = "t-lack-middleware-session";
      
      sourceProject = "${lisp-project_lack}";
      patches = [];
      lisp_dependencies = "${lisp_cl-cookie} ${lisp_prove} ${lisp_local-time} ${lisp_circular-streams} ${lisp_http-body} ${lisp_quri} ${lisp_ironclad} ${lisp_prove-asdf}";
      name = "lisp_t-lack-middleware-session-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
