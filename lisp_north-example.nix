
{ buildLispPackage, stdenv, fetchurl, lisp-project_north, 
   lisp_clip, lisp_hunchentoot, lisp_documentation-utils, lisp_crypto-shortcuts, lisp_uuid, lisp_drakma,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_clip lisp_hunchentoot lisp_documentation-utils lisp_crypto-shortcuts lisp_uuid lisp_drakma  ];
      inherit stdenv;
      systemName = "north-example";
      
      sourceProject = "${lisp-project_north}";
      patches = [];
      lisp_dependencies = "${lisp_clip} ${lisp_hunchentoot} ${lisp_documentation-utils} ${lisp_crypto-shortcuts} ${lisp_uuid} ${lisp_drakma}";
      name = "lisp_north-example-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
