
{ buildLispPackage, stdenv, fetchurl, lisp-project_lack, 
   lisp_cl-base64, lisp_dbi, lisp_lack-middleware-session, lisp_marshal, lisp_trivial-utf-8,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-base64 lisp_dbi lisp_lack-middleware-session lisp_marshal lisp_trivial-utf-8  ];
      inherit stdenv;
      systemName = "lack-session-store-dbi";
      
      sourceProject = "${lisp-project_lack}";
      patches = [];
      lisp_dependencies = "${lisp_cl-base64} ${lisp_dbi} ${lisp_lack-middleware-session} ${lisp_marshal} ${lisp_trivial-utf-8}";
      name = "lisp_lack-session-store-dbi-20170725-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
