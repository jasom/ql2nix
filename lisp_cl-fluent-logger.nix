
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-fluent-logger, 
   lisp_local-time, lisp_cl-messagepack, lisp_usocket, lisp_pack, lisp_jonathan,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_local-time lisp_cl-messagepack lisp_usocket lisp_pack lisp_jonathan  ];
      inherit stdenv;
      systemName = "cl-fluent-logger";
      
      sourceProject = "${lisp-project_cl-fluent-logger}";
      patches = [];
      lisp_dependencies = "${lisp_local-time} ${lisp_cl-messagepack} ${lisp_usocket} ${lisp_pack} ${lisp_jonathan}";
      name = "lisp_cl-fluent-logger-20170725-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
