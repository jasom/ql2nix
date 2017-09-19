
{ buildLispPackage, stdenv, fetchurl, lisp-project_lack, 
   lisp_trivial-utf-8, lisp_cl-base64, lisp_marshal, lisp_cl-redis, lisp_local-time, lisp_circular-streams, lisp_http-body, lisp_flexi-streams, lisp_quri, lisp_prove, lisp_ironclad, lisp_prove-asdf,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_trivial-utf-8 lisp_cl-base64 lisp_marshal lisp_cl-redis lisp_local-time lisp_circular-streams lisp_http-body lisp_flexi-streams lisp_quri lisp_prove lisp_ironclad lisp_prove-asdf  ];
      inherit stdenv;
      systemName = "t-lack-session-store-redis";
      
      sourceProject = "${lisp-project_lack}";
      patches = [];
      lisp_dependencies = "${lisp_trivial-utf-8} ${lisp_cl-base64} ${lisp_marshal} ${lisp_cl-redis} ${lisp_local-time} ${lisp_circular-streams} ${lisp_http-body} ${lisp_flexi-streams} ${lisp_quri} ${lisp_prove} ${lisp_ironclad} ${lisp_prove-asdf}";
      name = "lisp_t-lack-session-store-redis-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
