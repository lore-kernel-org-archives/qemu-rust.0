Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1thm8J-00069o-Fj
	for mharc-qemu-rust@gnu.org; Tue, 11 Feb 2025 04:00:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1thm8I-00069H-1j
 for qemu-rust@nongnu.org; Tue, 11 Feb 2025 04:00:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1thm8E-0002R5-OE
 for qemu-rust@nongnu.org; Tue, 11 Feb 2025 04:00:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739264435;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o5v9t+9/fcL9IGx6vUBnu+RzuqIZpc3aR2eLKlG7hyU=;
 b=AqQTfW7yxhRFcwH2Eq4pmAI+1FeDu8VpTd0/zMwAH3kOR1VI9H5Z432Xr5D9Xmf9lq1laQ
 HLd98SlqR7ayFRMq+alPCGHONYK6VIivQ34R8UnEuRGbJV00gsTymvutErxsYjkcS3S5fg
 OGEvKhrTj8yPhKEfuOnlpAhTsZYNcSQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-336-h73Fo3BwO_GzWVWQL_7eVQ-1; Tue, 11 Feb 2025 04:00:33 -0500
X-MC-Unique: h73Fo3BwO_GzWVWQL_7eVQ-1
X-Mimecast-MFC-AGG-ID: h73Fo3BwO_GzWVWQL_7eVQ
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-38ddba9814bso948463f8f.3
 for <qemu-rust@nongnu.org>; Tue, 11 Feb 2025 01:00:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739264432; x=1739869232;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=o5v9t+9/fcL9IGx6vUBnu+RzuqIZpc3aR2eLKlG7hyU=;
 b=A3pbIQshjeFyhjGfQZilYUXz7P1kZFBGIgRSLqU6GlgHJCPDaD6JxEAmbYUURz8msU
 /rHT0nBgTjarVpkPPyQCnef/xJAiIwqAOJInXqRzveziDtPYo57Vf+gCHvXFkDu3gNI3
 lNWa5ah8KrB8i640j71kcBf5WscwS5ok6zfjFKBVBaa92f2eOAtZ/Unq3Zk69IOl8w5j
 frW52IXZmfxeE50NTICSxWxzcZEBesqvr2/U9h/j59bkmjeRg+B3XGyb6l5sgbSMPKGq
 dOU/ZnPQhPtZ8AxjssCnCKx+mJv+2IBwhtU/5ohh48j00ERHhDAAKWhHaBSYFKfcg+1+
 6jqw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW86mn8RdNDU1b93HMQFvz4RBM8+n+rwPstLpPvwDpx2fq1Wz/+P1QI5mAd/L9BX1zGVM1zRtBerw4=@nongnu.org
X-Gm-Message-State: AOJu0YzqLwGoU1c42BYVF5Gi2yDU3TG53oHNdtRco8BPA3C/TK+yAzfd
 9i2D9eugecs8W59VxxvPZoiGGkrL564s6oNgugTXmeRqALi2u0D3+tRAvmN7PaSxazxdW0Tcfyd
 Q4uD6+9JFYbRP+BXjsloNR8hphD0pfIyFekFqZe75Hr4tOoEUJPPRFperUkrhuA9eOstQIRrzJ5
 idxiqQyTMJ1OBcICf2tNU6vCo95A==
X-Gm-Gg: ASbGnctfyX7ZS2Bh8jdaTBBordeMqiXO7Z4PmTRwrZ9+HfxT8zw15Ek1uzrwNc/2F3G
 dJTKLw/1cM9Ikey4Avvnp32797fWzzJeuGLQ3DzobLk8KuwnqDpVsKQDQFJ0D
X-Received: by 2002:a5d:4286:0:b0:38b:da6a:8a02 with SMTP id
 ffacd0b85a97d-38dc94914bemr10012992f8f.47.1739264432081; 
 Tue, 11 Feb 2025 01:00:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF9SnDFOxBawFtRMNNd7IMii8ZyjLGLlWvXhBKendc7FrUTAzok6ZPnfhngKrdbLAaEpbd+7PRuQt2m/d/CcIU=
X-Received: by 2002:a5d:4286:0:b0:38b:da6a:8a02 with SMTP id
 ffacd0b85a97d-38dc94914bemr10012956f8f.47.1739264431645; Tue, 11 Feb 2025
 01:00:31 -0800 (PST)
MIME-Version: 1.0
References: <20250206111514.2134895-1-pbonzini@redhat.com>
 <20250206111514.2134895-2-pbonzini@redhat.com>
 <Z6nOAftJsjQ7KAiS@intel.com> <c7685bff-96d1-4e89-ba19-08fbba399d37@redhat.com>
 <SY0P300MB1026B9C81F2EF236BB703F2B95FD2@SY0P300MB1026.AUSP300.PROD.OUTLOOK.COM>
In-Reply-To: <SY0P300MB1026B9C81F2EF236BB703F2B95FD2@SY0P300MB1026.AUSP300.PROD.OUTLOOK.COM>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 11 Feb 2025 10:00:19 +0100
X-Gm-Features: AWEUYZlEd5ovXBUFtA1NaKqmdeWeYQgOpWyQOuDmrpvMZBV1dGFLpqyBnnqffpk
Message-ID: <CABgObfbTx9DNkkzw8EeMRU0+L6_+P64KHtAJTUwsW40mtwGSOg@mail.gmail.com>
Subject: Re: vtables and procedural macros (was Re: [PATCH] rust: pl011:
 convert pl011_create to safe Rust)
To: Junjie Mao <junjie.mao@hotmail.com>
Cc: Zhao Liu <zhao1.liu@intel.com>, qemu-devel@nongnu.org, qemu-rust@nongnu.org,
 qemu-stable@nongnu.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: _g0Y2xuoH902eOo7euUZy3cJOFBZqzYl4gXEnFKKj9o_1739264432
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.388,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 11 Feb 2025 09:00:42 -0000

On Tue, Feb 11, 2025 at 7:47=E2=80=AFAM Junjie Mao <junjie.mao@hotmail.com>=
 wrote:
> I would suggest to keep the "sysbus" prefix in the method name, or in
> general, keep the class prefix in the method names in XXXClassMethods
> traits. Otherwise APIs from different parent classes may also
> conflict. As an example, in the following class hierarchy:
>
>   Object -> DeviceState -> PCIDevice -> PCIBridge -> ...
>
> For PCIDevice instances there is an API pci_device_reset(), and for
> PCIBridge ones pci_bridge_reset(). Without class prefixes both will be
> wrapped (as blanket impl in two traits) as reset() and a dev.reset()
> call will lead to a "multiple applicable items in scope" build error.

Yes, reset is definitely a problem.

I will wrap qdev_realize() in DeviceMethods to check if you get
"multiple applicable items" from that as well.

I can also go back and add "sysbus_" in front of init_mmio, init_irq,
etc.; but on the other hand we have Timer::{modify, delete} and
DeviceMethods::init_{clock,qdev}_{in,out}, should they be changed as
well? I'm not sure there is a single solution that always works.

> I agree that uses of proc macros should be carefully evaluated to see if
> they really help or hurt. In this specific case, I'm not sure if using
> attributes solves the root cause, though.

Yes, it doesn't help if you have multiple similarly-named methods
across the "superclasses".

Paolo


