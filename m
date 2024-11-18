Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tD13s-0007gC-C0
	for mharc-qemu-rust@gnu.org; Mon, 18 Nov 2024 07:41:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tD13o-0007Yr-G7
 for qemu-rust@nongnu.org; Mon, 18 Nov 2024 07:40:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tD13l-0004Rh-LN
 for qemu-rust@nongnu.org; Mon, 18 Nov 2024 07:40:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1731933648;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+Ca0cxM3UlWVse/L3ofROZ5zzW/nq8lsxvLIZ+MdO/Y=;
 b=X5XlH7p1zO7xzSes3cs/r3fwUhyyofcGE+lyxwCNIHzywRi2JX1WnfgIgngRzL5TySsHld
 tUAQWLHGazDVU+EvCTdd9BJoNjFGZ7WFlQPlCB2Zq5MY2vIN7UYnRf1mujm4sNh2MS60qe
 M4QdVkEQtpETTtOhqiar0CnvkZAWqPI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-571-J3-rVKwLNeaEEdgwAjrUGA-1; Mon, 18 Nov 2024 07:40:46 -0500
X-MC-Unique: J3-rVKwLNeaEEdgwAjrUGA-1
X-Mimecast-MFC-AGG-ID: J3-rVKwLNeaEEdgwAjrUGA
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-4315ad4938fso29779575e9.0
 for <qemu-rust@nongnu.org>; Mon, 18 Nov 2024 04:40:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731933646; x=1732538446;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+Ca0cxM3UlWVse/L3ofROZ5zzW/nq8lsxvLIZ+MdO/Y=;
 b=w2GgPTDe6edpcODnG/zvg4l2EKFzKNY7cCUAlXb47wifZLa3mviFlm8H9/2p2B+LPo
 ZAW9LbK4k/9nXThoS8N/bN7+YncFBT5r8ufb9omv5notLpdnE3tX9dxzew8PtJmxvHeU
 e6eOm3BnUSZZe+QPuoVObyr5HXr0dRX8g2wJyxMrj3awqrMjSAR2+F4bTRHbb92rsY7+
 77JSQkyBTH9wHlT6NwyJwcFKaA9IeYREHBbnF5mN2Qd32M4xKarD1m6owN4nvhyuxpNu
 d3HISm8nPoIu4WwJ40RZNmbl2DZtyCD1JKni1krDp09qfMmqBGWY/dPXZaORoAYDBLpb
 W7jA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXPFc5RNWS4Vgs585nuBM59gOQJp1ocTxiTOoXLerw41Bmps/mXAfI1rl+2e4Jsg6bK8aw40Hxu6uI=@nongnu.org
X-Gm-Message-State: AOJu0YwYG0dvOH+7Vpv2U0oz+uKCWw+Ua1G1K4rOogp78UxfZKERRV6b
 nh4wy5K7OyMu+kJruLDOPdBHnG2hSlJ+ck6ewxOR0Sq78qZlCinAdPGhhaxw3J2BI9LT+J8oxSB
 D00OtZsmMf8vJlnnOPLfVbIA+pa8AVvyVu/WY9WtXOkhHRrdAMjoxp4zafxm1CvyFOPv0IFx4kd
 Nevdd8W113JWmYdPbJGPXmfZ/Wnw==
X-Received: by 2002:a05:600c:a4c:b0:42c:a580:71cf with SMTP id
 5b1f17b1804b1-432df78f0f9mr115423395e9.30.1731933645640; 
 Mon, 18 Nov 2024 04:40:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGY31iOEOJwmH+GNU27tX4BuZTrW5dS++r1GU9Qd5XcWwkBSRwiBKIO45Bdr1fpps5/KsEGA6HVab1+k/qUOjk=
X-Received: by 2002:a05:600c:a4c:b0:42c:a580:71cf with SMTP id
 5b1f17b1804b1-432df78f0f9mr115423175e9.30.1731933645387; Mon, 18 Nov 2024
 04:40:45 -0800 (PST)
MIME-Version: 1.0
References: <20241117161039.3758840-1-manos.pitsidianakis@linaro.org>
 <875xoku5vd.fsf@draig.linaro.org>
In-Reply-To: <875xoku5vd.fsf@draig.linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 18 Nov 2024 13:40:33 +0100
Message-ID: <CABgObfaVs-3aXKXtQRLDbzCL56gbimWZoMchYi5G+QGu8r0AxA@mail.gmail.com>
Subject: Re: [PATCH v3] rust/pl011: Fix DeviceID reads
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, qemu-rust@nongnu.org, 
 Gustavo Romero <gustavo.romero@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Q_9VZhHAhIiklXPdRYbuw57m-U_nHC137a0M9lUDe4A_1731933646
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.142,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Mon, 18 Nov 2024 12:40:58 -0000

On Mon, Nov 18, 2024 at 12:41=E2=80=AFPM Alex Benn=C3=A9e <alex.bennee@lina=
ro.org> wrote:
> This is a nice improvement in conciseness over the separate legs removed =
bellow.
>
> > +                eprintln!("write bad offset {offset} at RO register {d=
ev_id:?} value {value}");
> > +            }
>
> Is a binding for qemu_log and friends on the todo list?

Yes, see https://lore.kernel.org/qemu-devel/20241024-rust-round-2-v1-10-051=
e7a25b978@linaro.org/
and my concerns at
https://lore.kernel.org/qemu-devel/e8e55772-906b-42cb-a744-031e6ae65f16@red=
hat.com/.

More reviews are welcome; in general, we should define a convention
for Rust functions and constants (is it okay to rename constants in
the Rust bindings if their C name is ugly? should functions keep or
lose the "qemu_*" prefixes?).

The corresponding patch to move from "eprintln!" to the logging
functions is at
https://lore.kernel.org/qemu-devel/20241024-rust-round-2-v1-11-051e7a25b978=
@linaro.org/.

Paolo


