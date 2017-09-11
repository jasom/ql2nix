
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-graylog, 
   lisp_graylog, lisp_log5,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_graylog lisp_log5  ];
      inherit stdenv;
      systemName = "graylog-log5";
      
      sourceProject = "${lisp-project_cl-graylog}";
      patches = [];
      lisp_dependencies = "${lisp_graylog} ${lisp_log5}";
      name = "lisp_graylog-log5-20160208-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
