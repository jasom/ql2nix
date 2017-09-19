
{ buildLispPackage, stdenv, fetchurl, lisp-project_lack, 
   lisp_cl-base64, lisp_trivial-utf-8, lisp_marshal, lisp_dbi, lisp_ironclad, lisp_local-time, lisp_circular-streams, lisp_http-body, lisp_quri,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-base64 lisp_trivial-utf-8 lisp_marshal lisp_dbi lisp_ironclad lisp_local-time lisp_circular-streams lisp_http-body lisp_quri  ];
      inherit stdenv;
      systemName = "lack-session-store-dbi";
      
      sourceProject = "${lisp-project_lack}";
      patches = [];
      lisp_dependencies = "${lisp_cl-base64} ${lisp_trivial-utf-8} ${lisp_marshal} ${lisp_dbi} ${lisp_ironclad} ${lisp_local-time} ${lisp_circular-streams} ${lisp_http-body} ${lisp_quri}";
      name = "lisp_lack-session-store-dbi-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
