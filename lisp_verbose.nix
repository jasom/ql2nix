
{ buildLispPackage, stdenv, fetchurl, lisp-project_verbose, 
   lisp_documentation-utils, lisp_dissect, lisp_local-time, lisp_piping,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_documentation-utils lisp_dissect lisp_local-time lisp_piping  ];
      inherit stdenv;
      systemName = "verbose";
      
      sourceProject = "${lisp-project_verbose}";
      patches = [];
      lisp_dependencies = "${lisp_documentation-utils} ${lisp_dissect} ${lisp_local-time} ${lisp_piping}";
      name = "lisp_verbose-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
