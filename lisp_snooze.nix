
{ buildLispPackage, stdenv, fetchurl, lisp-project_snooze, 
   lisp_rfc2388, lisp_parse-float, lisp_quri, lisp_closer-mop, lisp_cl-ppcre, lisp_alexandria,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_rfc2388 lisp_parse-float lisp_quri lisp_closer-mop lisp_cl-ppcre lisp_alexandria  ];
      inherit stdenv;
      systemName = "snooze";
      
      sourceProject = "${lisp-project_snooze}";
      patches = [];
      lisp_dependencies = "${lisp_rfc2388} ${lisp_parse-float} ${lisp_quri} ${lisp_closer-mop} ${lisp_cl-ppcre} ${lisp_alexandria}";
      name = "lisp_snooze-20161031-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
