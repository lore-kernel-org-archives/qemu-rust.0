Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uAo1T-0002Hb-Nz
	for mharc-qemu-rust@gnu.org; Fri, 02 May 2025 06:53:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uAo1N-0002AV-CG
 for qemu-rust@nongnu.org; Fri, 02 May 2025 06:53:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uAo1L-0005nP-Ib
 for qemu-rust@nongnu.org; Fri, 02 May 2025 06:53:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1746183210;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RvPeAOUjN/2G8r8d702zIIMXpkYXw6rozy6jk2q02Cc=;
 b=etWCGQ3EpP6wa8SbMjeh5UGvHMhUb0CB1f7Y0Hl8dUCzYLwkuuGEIbRaJdd7XKaefBhH+K
 vI3/KrxehZ6IGm1eDlOYUm/FTz0ukdHL8Rq8PkAO+HaVX6ohcZjrrI3abR364y0J9uzeDt
 eD8bn2YkLNSPIFjgkQZ/wySj1P7myDA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-480-pSbfzddfMd-ooDKcTMAfog-1; Fri, 02 May 2025 06:53:26 -0400
X-MC-Unique: pSbfzddfMd-ooDKcTMAfog-1
X-Mimecast-MFC-AGG-ID: pSbfzddfMd-ooDKcTMAfog_1746183206
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-43d5ca7c86aso10559875e9.0
 for <qemu-rust@nongnu.org>; Fri, 02 May 2025 03:53:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746183206; x=1746788006;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RvPeAOUjN/2G8r8d702zIIMXpkYXw6rozy6jk2q02Cc=;
 b=LOD119WCwdBHldxGGPXPNu+l/e43SIHSB1YFWrfC1e8OZcrb/XFqiNDL4biSh1p2Fw
 hxd5Z8rQYNGq+30bWawwSLDygVQBN2L/37b7QdFdQWLA1u8EYatrTk2UZP8c5XAfiM4C
 0DsjazrNjNHSEJwiTsG6+vyh/BVQUaXpDjyBrhlRkWKy4sndJAcYi44Af/yfR/pDrC8b
 8Tq4ma+RiURj+prFproRtBR15NCuIBt4J3VHzcaBhFgq2YJ1RWsmFLIcwm0qsWJNKpNm
 9epsMH2Q29NP1BcFdDYjP8dj/YUA5ZjUtopHS1pVQhMiuiV+xdRjbuVPZwTxU+GOLhpA
 0cRw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVFg9VRzuwxbbw8k1AfnIxRNjbbYjRLEPxBgSEfNZBg2yO2Zqf/upF8S9qV9U0p3nDwczKIeuQ9o4s=@nongnu.org
X-Gm-Message-State: AOJu0YyTI/jvY7O6qrsY7pmvMT4FNKle6TEEWSQZB+t03IW3ALupe91P
 zVp6ixfn/BXC1exx8WHnfoBXBo3iNQCheSFsKBHIV71nXtpkm84BGN4enGq9GW704t2UORmomFM
 vs4TVF0s2/LDqs/LQEzEGrtdf/jo9kr2I1SiWYkLU1F3OoeJRGfMuEhT2k0YmcAoh3YYH3YKwEp
 IWhvygZcdxHBZRpo47MJjZvzGKpQ==
X-Gm-Gg: ASbGnctJcVLCeP+Rd5nDEn15lISg5FYIw/IfPDIP13fapvDh3qSUfk0bo5LB0Ht4KWj
 fvyjJxjRCQuBZXY4Nc78Hj8EO6ySPlrHavZJhH221V1Y6UBUS6QY5vu3uvIfgkn4KRV8a
X-Received: by 2002:a05:600c:5022:b0:43c:e6d1:efe7 with SMTP id
 5b1f17b1804b1-441bbf34052mr16078015e9.26.1746183205668; 
 Fri, 02 May 2025 03:53:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFQPxHCxUTnCuCE+rVzGRuyw6wJlcEfWcdfh3/4glaTpsiXDj7Dc5Y4Y4ZZgMwe8q5OytOIl+FQUcKfCpjioiU=
X-Received: by 2002:a05:600c:5022:b0:43c:e6d1:efe7 with SMTP id
 5b1f17b1804b1-441bbf34052mr16077865e9.26.1746183205364; Fri, 02 May 2025
 03:53:25 -0700 (PDT)
MIME-Version: 1.0
References: <20250502102323.104815-1-pbonzini@redhat.com>
 <20250502102323.104815-8-pbonzini@redhat.com>
 <svmrjd.2xrfuqhgty9pb@linaro.org>
In-Reply-To: <svmrjd.2xrfuqhgty9pb@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 2 May 2025 12:53:08 +0200
X-Gm-Features: ATxdqUEH3DDusdJiUF44Ge6r2iRfaZJfN_8dzW9sWwYeyPVdeNrzJPSyZR7OXTY
Message-ID: <CABgObfaBcG5XA+_hwZ27xhdB-6g0AZ-vx7sBcPzG3K3c3930zg@mail.gmail.com>
Subject: Re: [PATCH 7/9] rust: replace c_str! with c"" literals
To: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-rust@nongnu.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: uEUOkH4De95e77JxVjvScZnZGNpGab1WnnK9uCmVRHc_1746183206
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.644,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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
X-List-Received-Date: Fri, 02 May 2025 10:53:33 -0000

On Fri, May 2, 2025 at 12:52=E2=80=AFPM Manos Pitsidianakis
<manos.pitsidianakis@linaro.org> wrote:
> This looks like it should go in the previous patch ("rust: remove
> offset_of replacement")
>
> Otherwise,
>
> Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>

You're right! Thanks for the review, and welcome back.

Paolo


