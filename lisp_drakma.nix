
{ buildLispPackage, stdenv, fetchurl, lisp-project_drakma, 
   lisp_puri, lisp_cl-base64, lisp_chunga, lisp_flexi-streams, lisp_cl-ppcre, lisp_chipz, lisp_usocket, lisp_cl-ssl,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_puri lisp_cl-base64 lisp_chunga lisp_flexi-streams lisp_cl-ppcre lisp_chipz lisp_usocket lisp_cl-ssl  ];
      inherit stdenv;
      systemName = "drakma";
      
      sourceProject = "${lisp-project_drakma}";
      patches = [];
      lisp_dependencies = "${lisp_puri} ${lisp_cl-base64} ${lisp_chunga} ${lisp_flexi-streams} ${lisp_cl-ppcre} ${lisp_chipz} ${lisp_usocket} ${lisp_cl-ssl}";
      name = "lisp_drakma-v2.0.3";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
