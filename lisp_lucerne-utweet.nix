
{ buildLispPackage, stdenv, fetchurl, lisp-project_lucerne, 
   lisp_avatar-api, lisp_cl-pass, lisp_cl-mustache, lisp_log4cl, lisp_clack-errors, lisp_myway, lisp_clack-v1-compat, lisp_clack,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_avatar-api lisp_cl-pass lisp_cl-mustache lisp_log4cl lisp_clack-errors lisp_myway lisp_clack-v1-compat lisp_clack  ];
      inherit stdenv;
      systemName = "lucerne-utweet";
      
      sourceProject = "${lisp-project_lucerne}";
      patches = [];
      lisp_dependencies = "${lisp_avatar-api} ${lisp_cl-pass} ${lisp_cl-mustache} ${lisp_log4cl} ${lisp_clack-errors} ${lisp_myway} ${lisp_clack-v1-compat} ${lisp_clack}";
      name = "lisp_lucerne-utweet-20160208-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
