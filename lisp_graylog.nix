
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-graylog, 
   lisp_babel, lisp_cl-json, lisp_local-time, lisp_salza2, lisp_usocket,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_babel lisp_cl-json lisp_local-time lisp_salza2 lisp_usocket  ];
      inherit stdenv;
      systemName = "graylog";
      
      sourceProject = "${lisp-project_cl-graylog}";
      patches = [];
      lisp_dependencies = "${lisp_babel} ${lisp_cl-json} ${lisp_local-time} ${lisp_salza2} ${lisp_usocket}";
      name = "lisp_graylog-20160208-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
