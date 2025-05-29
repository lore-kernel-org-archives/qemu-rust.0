Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uKZ3r-0004GM-Se
	for mharc-qemu-rust@gnu.org; Thu, 29 May 2025 04:56:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uKZ3o-0004FK-1W
 for qemu-rust@nongnu.org; Thu, 29 May 2025 04:56:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uKZ3l-0007Cs-OD
 for qemu-rust@nongnu.org; Thu, 29 May 2025 04:56:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1748508978;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BNNeFqUlcByu+PWkrGlLojjnEQaxP9V/jLSabAJZVkc=;
 b=FNVuMhb4z8ZhRJTqqKpIQ4LkvcwggB48JUapNAprC0GOajuC3dt18TDvI4I9iG3Pi31SAm
 T0CV9Ing7bPZm+5PuBhh+7zRtg43xj9piRUBXEAdMhXZP/XKLbj2tyvjiXDircZTZDxxd/
 WaEBR/yxrjnsrgNaDuzBhJsDc+ynzxM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-558-2YzSLzvsMdS8g8kuKsImKA-1; Thu, 29 May 2025 04:56:17 -0400
X-MC-Unique: 2YzSLzvsMdS8g8kuKsImKA-1
X-Mimecast-MFC-AGG-ID: 2YzSLzvsMdS8g8kuKsImKA_1748508976
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-3a362939f61so305572f8f.3
 for <qemu-rust@nongnu.org>; Thu, 29 May 2025 01:56:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748508976; x=1749113776;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BNNeFqUlcByu+PWkrGlLojjnEQaxP9V/jLSabAJZVkc=;
 b=Aiy/ixO21jOzjt1heE0/5lRzEwVon3l/1FDWep1IKMzZXMKOfuksMxLRFvb8bAT5FG
 nEdPmfFeH01aIvhRPF2q8iohlQj+krMpAMzL4sJInqlM5SlTCpdh3bYJgeJECh4Fueue
 Ryd+BVHXAGWoNY0hSPqEydIwVZVYxLB6PwagcYitX8gmQzmZVR1iS8mbXcKYzfW6TQmw
 IUpVRjb4e14r6dReGKebtT0aC0lYjGPoxlvdJi1UQutF4DqiCHSW2mj16Qm5N/+ONccl
 nfmFBptB90KGO7nTE+TVomLzyGSrG6Y86t9aqJ9RJ0ySqavmRTsDz1XWjG9sE1tRFB4i
 36Uw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUkHuGvG1PS/UohHYq4ZuetFjsZLjKtYm8ASl8zhg+D+NJt8V4kZG8fyYQvU79Zrb3GbbdkfMXoNpY=@nongnu.org
X-Gm-Message-State: AOJu0YwBexcXhU5b/YVSK2xoyfDqXd2VoOirzXXolV3sig0m/xVDFNQM
 ZU8W6CMYHbRnLX1E0fdMfXvJt8rg5Tl0EVO81hbxMCptzCFdd26j5DC399v7VDtAMuZnlOuQIyo
 KcQcjsz/u/AAFpxo+h0ezFysKSkUBfTli7+dKCcT3E1ejU5gj74zYH2V3OATY14wTSvw2MqLT8T
 jVePz/zBkhmhsTHXFY5rNCwFUr7Y4BdQ==
X-Gm-Gg: ASbGncthsfIm8IbrSqzjAlfcUNdqBcsIG/8FCUfpXtX5+HAZ1AVzz+T/R9yRNLmFnnW
 z1mmXs08XgFhz5x6ByCmxsN4veaF1ijU8qOMnDUYwmYrQx6kv39Hn90z7+YR8FpJXOTRs
X-Received: by 2002:a05:6000:290c:b0:3a3:5833:c900 with SMTP id
 ffacd0b85a97d-3a4cb461464mr15322453f8f.8.1748508976222; 
 Thu, 29 May 2025 01:56:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGxNc39dZZW+GHRjljY+le8r2EQsQQW/cHk3ceeZuz6e70JSUJXIoJZdVLrxfvnifZKrN8FV+qTnU0INMUYFHc=
X-Received: by 2002:a05:6000:290c:b0:3a3:5833:c900 with SMTP id
 ffacd0b85a97d-3a4cb461464mr15322438f8f.8.1748508975878; Thu, 29 May 2025
 01:56:15 -0700 (PDT)
MIME-Version: 1.0
References: <20250526142254.1061009-1-pbonzini@redhat.com>
 <20250526142455.1061519-11-pbonzini@redhat.com>
 <aDglrxH6o6spPC2v@intel.com>
In-Reply-To: <aDglrxH6o6spPC2v@intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 29 May 2025 10:56:00 +0200
X-Gm-Features: AX0GCFsHkGLWb93F_i-jHjE3WhpQk7dLboBtx7h4u07UTrQUn3cB0VAdebO_cKk
Message-ID: <CABgObfbsM=-P4pS+oE+XkAfW28fP2Uq+oTYE5qMgKWRq8Qvttw@mail.gmail.com>
Subject: Re: [PATCH 11/12] rust/hpet: return errors from realize if properties
 are incorrect
To: Zhao Liu <zhao1.liu@intel.com>
Cc: qemu-devel@nongnu.org, armbru@redhat.com, qemu-rust@nongnu.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: qvo_2ZFuIZyobNlIubNukJQ5_Ot6wvpJO7dd-QDvjhI_1748508976
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.904,
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
X-List-Received-Date: Thu, 29 May 2025 08:56:25 -0000

On Thu, May 29, 2025 at 10:54=E2=80=AFAM Zhao Liu <zhao1.liu@intel.com> wro=
te:
> >          if self.int_route_cap =3D=3D 0 {
> > -            // TODO: Add error binding: warn_report()
> > -            println!("Hpet's hpet-intcap property not initialized");
> > +            Err("hpet.hpet-intcap property not initialized")?;
> >          }
>
> Though here we don't need print warning...do we still need to provide
> the warn_report() binding? Or println!() is enough in Rust side?

I think it will be enough to have Error ** and
LOG_GUEST_ERROR/LOG_UNIMP... but we'll see.

Paolo


