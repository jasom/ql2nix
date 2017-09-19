
{ buildLispPackage, stdenv, fetchurl, lisp-project_drakma, 
   lisp_cl-ssl, lisp_usocket, lisp_chipz, lisp_cl-ppcre, lisp_flexi-streams, lisp_chunga, lisp_cl-base64, lisp_puri,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-ssl lisp_usocket lisp_chipz lisp_cl-ppcre lisp_flexi-streams lisp_chunga lisp_cl-base64 lisp_puri  ];
      inherit stdenv;
      systemName = "drakma";
      
      sourceProject = "${lisp-project_drakma}";
      patches = [];
      lisp_dependencies = "${lisp_cl-ssl} ${lisp_usocket} ${lisp_chipz} ${lisp_cl-ppcre} ${lisp_flexi-streams} ${lisp_chunga} ${lisp_cl-base64} ${lisp_puri}";
      name = "lisp_drakma-v2.0.4";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
