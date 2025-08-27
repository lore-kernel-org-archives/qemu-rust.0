Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3159CA0EFF
	for <qemu-rust@archiver.kernel.org>; Wed, 27 Aug 2025 17:26:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1urJuW-0002vg-Ks; Wed, 27 Aug 2025 13:26:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1urJuU-0002tR-7D
 for qemu-rust@nongnu.org; Wed, 27 Aug 2025 13:26:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1urJuQ-0003BW-GD
 for qemu-rust@nongnu.org; Wed, 27 Aug 2025 13:26:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1756315559;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bqtdo45yfZ59Xenw349d6laLyJdcIHIVyOugR+OF3zY=;
 b=g2NJFg0YMf+cRsa13tyDJ9uEy2fug7FU2/xuH809qlMD+Elx5ZylK7YpfhEBoyKbzMgmDV
 gkIicajoOzE+w6mCLLqZj3qnQBS171j/f7HfVX8IlkSqJdyNpiKMTuv9hzkAFfyQGOqmf+
 1S8h2t9EwIxYWp3sbfHJq6nBFTXsy4I=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-160-mW9DxgtiOb640jghXtIsTg-1; Wed, 27 Aug 2025 13:25:58 -0400
X-MC-Unique: mW9DxgtiOb640jghXtIsTg-1
X-Mimecast-MFC-AGG-ID: mW9DxgtiOb640jghXtIsTg_1756315557
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-3c79f0a57ddso33685f8f.1
 for <qemu-rust@nongnu.org>; Wed, 27 Aug 2025 10:25:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756315556; x=1756920356;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bqtdo45yfZ59Xenw349d6laLyJdcIHIVyOugR+OF3zY=;
 b=mWPceued+8Fw2gSlGSVSjITVdpZjoIYSGgjN2mW+VrL5pNZNyp68hu+LetNVaIeTXI
 O9BXiyDwdR4BP4AisLwWMS8SQeF9j7ZB23Inrj8yaYX/eOU6Pt/rCDgI1m0MisSO6/hS
 jLklNHP6UV8EWNWtU5gNJEson3ZciE4KXE/fd72Y8bgqXYwK02BsPHmVKVABptzCAGEV
 CWPzaHibOGqMsrC+doMWdpLyyO6QvsgQYC/jnxEgLbGM2lkG29aEu+8LYbEcgtB75N1j
 1DW3jQcq1HLjq4/gpCz9Iu8hX8UCUAe0zUKk2XHqM4/uBcPX1IA0ksepvCkfTH6qbDpA
 SF/w==
X-Forwarded-Encrypted: i=1;
 AJvYcCULgDpBTcA3GK2Mui3G+D7h9i4mPjZJ7g6j9FfBH2aioexvaj4B58VzaRYit2yhDX0lRUxF6APC5sQ=@nongnu.org
X-Gm-Message-State: AOJu0YzL72tz48YYNhVB552zT2w3VNsCBY39EUeaxUkVUFFNDDxpNi8X
 0ol40cSslUbPdjpXSyUwQpiodd7VlhFRbvFgl3KOYBpea4YjqAWEIDvm1S8teOo609cHS34cKBd
 +yt8iO5aeAqNefaaZvFLutHIxZ/W1/7gQ2nwWABQBKB3qwvtgFaG2ioesicEu4HHZ8PnGP1tCNB
 D4Z7qFjh6GFqEgtSj0hKPwvNClqqq/rw==
X-Gm-Gg: ASbGnctoBpLC9zCXh/4esrSu1PSfz/0FlUwDKAUOgVrGS9NTPGdezNkhV2QFRL67KJH
 GdhdJkOFIqulD7pc7ndj8m9MzDtKhbFa+nY9bb12wb8lFIwDut/Dxq9EVKTwbLbWZOTCdaLGrFP
 wW85ewHomlMCL6KKV6SjSf6LkbDQ0gvC4FDAiYKqOa2RDfNpf712DtvU4JsczNdVprcrPh5qbNf
 tYi5asQdMdw56hiwNYtbwVY
X-Received: by 2002:a05:6000:40c9:b0:3c9:52db:9f64 with SMTP id
 ffacd0b85a97d-3c952dba323mr9274301f8f.22.1756315556575; 
 Wed, 27 Aug 2025 10:25:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEj2B8F0gX2zqSi5oUd0dmgAOtMZCRqFZW6+faOXyrPLoZa8Jluznh/kqIYStSYjFl2ILAqhWGXl6XZAKinR2M=
X-Received: by 2002:a05:6000:40c9:b0:3c9:52db:9f64 with SMTP id
 ffacd0b85a97d-3c952dba323mr9274286f8f.22.1756315556151; Wed, 27 Aug 2025
 10:25:56 -0700 (PDT)
MIME-Version: 1.0
References: <20250827104147.717203-1-marcandre.lureau@redhat.com>
In-Reply-To: <20250827104147.717203-1-marcandre.lureau@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 27 Aug 2025 19:25:43 +0200
X-Gm-Features: Ac12FXyo8WIeMmAiMQhntMuSM3t8U04awH6yQ4Ew0JS44Wd30kR8YTRn5_MBWiU
Message-ID: <CABgObfb0tQZz5WHWuHW8Q3nkEjFcYxGzoMTTxW1oyVCWv+5MUQ@mail.gmail.com>
Subject: Re: [PATCH 00/22] rust: split qemu-api
To: marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org, qemu-rust@nongnu.org, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 7TODlwrUAnlzOD_fCvcyfv9ZHz8D35PXzO0p0Bg771U_1756315557
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Wed, Aug 27, 2025 at 12:42=E2=80=AFPM <marcandre.lureau@redhat.com> wrot=
e:
> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> Hi,
>
> qemu-api is providing bindings for various internal libraries. Instead, t=
he
> bindings requirements should match the various libraries and use the mini=
mal set
> of dependencies.
>
> An initial Rust-only "common" crate is introduced, then "util" (for libqe=
muutil,
> without bql), "migration" (so it doesn't depend on bql), "bql", "qom" (ar=
guably,
> bql shouldn't be required?), and "chardev", "system", "hwcore". Finally t=
he
> qemu-api crates are renamed and repurposed.

The only question I have is about having bindings in each crate rather
than in a single common crate. I'm okay with doing this on top,
especially given that I spent too much time rebasing on top of all the
pending patches. :)

Right now I'm stuck with doctests failures with the patches that use
Meson's new support for mixed C and Rust targets. I'll probably drop
that, but (as a heads up) I"m probably not going to send out a pull
request until after KVM Forum.

Paolo


