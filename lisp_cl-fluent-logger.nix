
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-fluent-logger, 
   lisp_jonathan, lisp_pack, lisp_usocket, lisp_cl-messagepack, lisp_local-time,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_jonathan lisp_pack lisp_usocket lisp_cl-messagepack lisp_local-time  ];
      inherit stdenv;
      systemName = "cl-fluent-logger";
      
      sourceProject = "${lisp-project_cl-fluent-logger}";
      patches = [];
      lisp_dependencies = "${lisp_jonathan} ${lisp_pack} ${lisp_usocket} ${lisp_cl-messagepack} ${lisp_local-time}";
      name = "lisp_cl-fluent-logger-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
