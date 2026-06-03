Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9266CD6E64
	for <qemu-rust@archiver.kernel.org>; Wed,  3 Jun 2026 08:37:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1wUh67-00069B-V5; Wed, 03 Jun 2026 04:37:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1wUh66-00068d-16
 for qemu-rust@nongnu.org; Wed, 03 Jun 2026 04:37:10 -0400
Received: from mail-dy1-x1333.google.com ([2607:f8b0:4864:20::1333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1wUh64-0006s9-Dz
 for qemu-rust@nongnu.org; Wed, 03 Jun 2026 04:37:09 -0400
Received: by mail-dy1-x1333.google.com with SMTP id
 5a478bee46e88-3075afe5247so27904eec.0
 for <qemu-rust@nongnu.org>; Wed, 03 Jun 2026 01:37:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780475826; cv=none;
 d=google.com; s=arc-20240605;
 b=AmgNIlQL3OVTwCR+IJKuhS+LTpF5rbEFsRC6NiFjUhqYkhfe82ytrfbsVZI0tThHKh
 8J3gwj1LWYMNLmxXIHVaxezlpWU4i5dy+9JlbEQaiVChd8I0kt+XxIRXTqsnNloJd8yc
 ZPipf5bnfVOVJgsBHod2cQYaA0k5tY+4awDljsG8ETO9kSiXbaNDZYqDBbPMMAn6p2bO
 DzBn1QWwzNcbteTTvtY0PQUUNefflKQdJOvreNmjdC4UrZZfQeKkLHGAR6I6i+t73uiV
 NJT1+fQcWAABnwHb2/9JswLZCJxedv9Aeea5lBS2cDPdS3m6Nyk1HRHwl2F1S6Wdiaf6
 +Uyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=OvZJrmEy64tq3WyQB3acgCZUJZT0YGXjdNcY6sseLf0=;
 fh=JcjXu6cATMQo0NqjeCPYmrOlbK3gfdNU69eN6vmufQY=;
 b=DNLBg5V7WxTLVlyDMuZEWxwcM7Eucivh5fX+DfiICcS/YMZpzXJW//+02u3cX9D59C
 pgLEhscJVRTapiLFSaBrbKQ/wOc7L69BJBVUgzhIATYtOxdWwJJbGsyqKaU4wSSLqSVy
 WXncV5ExFHgMbtaEXYqCIfiTIHG23SQrrPnSvJ8U4OgnwJOV3jcTwe/5kFJEV2KAeLC+
 7m311zTGv4bUq+OqqZU8cX5U2Fw3hgdQAWmcDQz/20+cD6smlAiJMS8LHjPQ3Bz7C6gR
 bdynjjz618aznils7d5kfG0/1rzULj03sVGNrTuc+dELu6ug1mr11mo61lOwB0x8RiB9
 Pgxw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; s=google; t=1780475826; x=1781080626; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OvZJrmEy64tq3WyQB3acgCZUJZT0YGXjdNcY6sseLf0=;
 b=haskS+8K/SPULcGBJsE1ZStfp10Xvr+/2zws7gc8rZHSsHyZ6+Gh0rmksYaw5a78ru
 /WrJNT1cLpxZS7UsZKUEtJlI7JIL1MSu+iCzQurZjVw1srqo6K337xnV4JbzR3/owIDW
 6IzFqATiIE+CU2dgJxJgccyQUpiLjPoIiQuClXFdlWjaFhTst7P7cWM1PhAmY8phLVVA
 WAFS491ktFnXbKSrvckLTWfBPI2E4G9kNKjrq9eXr35+0LQgpCT9FXdpOpjp3Yq95hSD
 QNLJkJQyujoGKF4ScF4MyYreegX5JslGr3d1heGBx6Fb00kZpfVXAc6RI/vOVKrS50KF
 9Cew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780475826; x=1781080626;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=OvZJrmEy64tq3WyQB3acgCZUJZT0YGXjdNcY6sseLf0=;
 b=WwZs/LtCZvB0FSseA7OfSwd1TuVshVguQb6KZp0RyiY0G18Be6wKE+9sVeUvQQBLV2
 nF+Iq9OHaxAI7a4XN+G7DaoI4xxhFyEtnlwo+3UNj/+6rM1MZndP+3XBqEgQlFERBdTV
 06gvOqNB0+P3Y/22d7terGDi9HO/6GNT7Qk/JKE6umdKrS9oAAH5Z2BzqDV0BQVI1p7T
 4KB2lH3dPMjUcetRRqc85V2UPUR+TxC2p8Da3hZ7oRFFsI4A1PeGtxClhmHuPB5AGWIC
 p8fSMbkqVkPqounrAhW1w9IiEgJ2RnUzuV1ddPXsAd+CP2Pk3kEMfrFr36/4B7JOil31
 7RzA==
X-Forwarded-Encrypted: i=1;
 AFNElJ/0z53YCgD93+p2BFARJA55Qq3pBZw+Y7QbbPWW1yRT2CkJZ7hIsjGW9dPg5Qr525LGGr/UCq6mRYg=@nongnu.org
X-Gm-Message-State: AOJu0Ywr2c8fmw9l9yBPIbOyznSbnQDvkcIn3QrDndGOVsI6RUkhbW3M
 Oz2DvYOUsfwMyxVW2zhdr96XzIqUf8SNm230pfeJdz/epbj4jguZslitu+WcIdefUSJG0tIna0s
 Xxwi5/7XWxP4KJGLLam4R5nv4ctOfeDY=
X-Gm-Gg: Acq92OFuomAklV5IQoagkKUTYG6PR8wtND+tkwwVMnaIh7diQgtdJ1DVCUgdt6lSNZ7
 PVKrisLOAfTEcsNiW5BqwZ7yX2xwXm4xqB4oWybJIsksK2tFlZxDnV9kRw90s57x4Za5Tm4AD1R
 tvQQRKrE+w4OrQRENjCIdqZ2J863X7l2iYiIKdhC/cozwFp1FcPOxmGt3QdMmXXqI1Nd6mqmaRI
 +tdkT4/mPVSbZijFqrsYwgV0ory+6fbNxWmfNJRxmOxjZiD6pVvn5VRttN1XFpkjVww+eMdNLWj
 IrspQw1KUQUTi40Jm2Kagb88fCa5JiHcw5M+W9ju4CcU+quVcg==
X-Received: by 2002:a05:7300:df4a:b0:2ed:e16:6b4a with SMTP id
 5a478bee46e88-3074fc4eb73mr1223503eec.32.1780475826203; Wed, 03 Jun 2026
 01:37:06 -0700 (PDT)
MIME-Version: 1.0
References: <20260108131043.490084-1-pbonzini@redhat.com>
 <20260108131043.490084-17-pbonzini@redhat.com>
In-Reply-To: <20260108131043.490084-17-pbonzini@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Wed, 3 Jun 2026 12:36:53 +0400
X-Gm-Features: AVHnY4IMV2tonU5IL68xxsIVKeMJFh68kMYU8BSz3Le0qc-8aWYPStTgUWt2BtE
Message-ID: <CAJ+F1CLTM64zfr4e6b9X1zAqs_+=rRZ27KCEQLG_Fxj7ybQWaQ@mail.gmail.com>
Subject: Re: [PATCH v2 16/16] rust/tests: QAPI integration tests
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, armbru@redhat.com, qemu-rust@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1333;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-dy1-x1333.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-rust@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: QEMU Rust-related patches and discussion <qemu-rust.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-rust>,
 <mailto:qemu-rust-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-rust>
List-Post: <mailto:qemu-rust@nongnu.org>
List-Help: <mailto:qemu-rust-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-rust>,
 <mailto:qemu-rust-request@nongnu.org?subject=subscribe>
Errors-To: qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org
Sender: qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org

Hi

On Thu, Jan 8, 2026 at 5:13=E2=80=AFPM Paolo Bonzini <pbonzini@redhat.com> =
wrote:
>
> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  rust/tests/meson.build          |  21 +-
>  rust/tests/tests/integration.rs |   2 +
>  rust/tests/tests/qapi.rs        | 444 ++++++++++++++++++++++++++++++++
>  3 files changed, 464 insertions(+), 3 deletions(-)
>  create mode 100644 rust/tests/tests/integration.rs
>  create mode 100644 rust/tests/tests/qapi.rs
>
...
> +    let qsa =3D to_qobject(&expected).unwrap();
> +    let json =3D qsa.to_json();
> +    assert_eq!(
> +        json,
> +        "{\"port\": \"port-val\", \"keep_alive_idle\": 42, \"host\": \"h=
ost-val\"}"
> +    );

We need to fix the field names to produce the correct wire format:

index 41ed83c381d..3e0bd237d8c 100644
--- a/scripts/qapi/rs_types.py
+++ b/scripts/qapi/rs_types.py
@@ -163,15 +163,21 @@ def gen_struct_members(members:
List[QAPISchemaObjectTypeMember],
             typ =3D 'Box<%s>' % typ
         if memb.optional:
             typ =3D 'Option<%s>' % typ
+        field_name =3D rs_name(camel_to_lower(memb.name))
+        serde_rename =3D ''
+        if field_name.removeprefix('r#') !=3D memb.name:
+            serde_rename =3D '#[serde(rename =3D "%s")]' % memb.name
         ret.append(mcgen('''
 %(cfg)s''', '''
 %(skip_if)s''', '''
+%(serde_rename)s''', '''
     pub %(rs_name)s: %(rs_type)s,
 ''',
                          cfg=3Dmemb.ifcond.rsgen(),
                          skip_if=3DSERDE_SKIP_NONE if memb.optional else '=
',
+                         serde_rename=3Dserde_rename,
                          rs_type=3Dtyp,
-                         rs_name=3Drs_name(camel_to_lower(memb.name))))
+                         rs_name=3Dfield_name))

